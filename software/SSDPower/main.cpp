/*
© [2021] Microchip Technology Inc. and its subsidiaries.

Subject to your compliance with these terms, you may use Microchip software and
any derivatives exclusively with Microchip products. It is your responsibility
to comply with third party license terms applicable to your use of third party
software (including open source software) that may accompany Microchip software.

THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER EXPRESS,
IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES
OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSE.

IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER
RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF
THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY
LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY RELATED TO THIS
SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY
TO MICROCHIP FOR THIS SOFTWARE.
*/

/*
Previous steps: The corresponding .lib file for each distribution was added (could be found in Solution settings: Linker->Input->Additional Dependencies)
Prerequisites: In this example we've used a PICkit Serial I2C Demo Board. Also, this example will work only as expected only if a single MCP2221A is connected.
Description: This is a simple "visual" example on how to use the MCP23008 I/Os. The I/O pins are connected to 8 LEDs. We will make all the I/Os as
GPIO outputs and then we will send a hec value to the MCP23008's I/O port, showing a LED pattern(for MAX_NUMBER_OF_CYCLES).
*/

#include <iostream>
#include <fstream>
#include <string>
#include <windows.h>
#include <conio.h>
//======================================
#define MCP2221_LIB        1	//for projects importing the .lib, use the MCP2221_LIB preprocessor definition
#include "mcp2221_dll_um.h"

//======================================
#define VER_NUM 1
#define DEFAULT_VID                     0x04D8
#define DEFAULT_PID                     0x00DD
#define NB_BYTES    3
#define NO_SN_LABEL    "NoSN"
#define STOP_CHAR    'S'

extern const char* cur_date;

int result = 0;
int step = 0;
void* mcpHandle = NULL;

unsigned char i2cData[NB_BYTES]; // буфер для приема и передачи данных по i2c
unsigned int slaveAddressINA226 = 0; // B1000000 = 0x40 = A1 -> GND + A2 -> GND 
unsigned char use7bitAddress = 1;
unsigned char INA226ConfReg = 0x00; // Configuration Register Pointer Address
unsigned char INA226ManIDReg = 0xFE; // Manufacturer ID Register
unsigned char INA226ShuntVolReg = 0x01; //  Shunt Voltage Register = Shunt voltage measurement data
unsigned char INA226BusVolReg = 0x02; //  Bus Voltage Register = Bus voltage measurement data
HANDLE gErrorEvent;

//======================================

VOID CALLBACK TimerRoutine(PVOID lpParam, BOOLEAN /*TimerOrWaitFired*/)
{
  std::fstream* lp_log_file = (std::fstream*)lpParam;
  i2cData[0] = INA226ShuntVolReg;
  result = Mcp2221_I2cWrite(mcpHandle, 1, slaveAddressINA226, use7bitAddress, i2cData);
  if (result != E_NO_ERR)
  {
    std::cout << "\nERROR >> Mcp2221_I2cWrite() returned: " << result << "\n";
    SetEvent(gErrorEvent);
    return;
  }
  result = Mcp2221_I2cRead(mcpHandle, 2, slaveAddressINA226, use7bitAddress, i2cData);
  if (result != E_NO_ERR)
  {
    std::cout << "\nERROR >> Mcp2221_I2cRead() returned: " << result << "\n";
    SetEvent(gErrorEvent);
    return;
  }
  std::swap(i2cData[0], i2cData[1]);
  (*lp_log_file) << *((int16_t*)i2cData) << "\t"; 
  i2cData[0] = INA226BusVolReg;
  result = Mcp2221_I2cWrite(mcpHandle, 1, slaveAddressINA226, use7bitAddress, i2cData);
  if (result != E_NO_ERR)
  {
    std::cout << "\nERROR >> Mcp2221_I2cWrite() returned: " << result << "\n";
    SetEvent(gErrorEvent);
    return;
  }
  result = Mcp2221_I2cRead(mcpHandle, 2, slaveAddressINA226, use7bitAddress, i2cData);
  if (result != E_NO_ERR)
  {
    std::cout << "\nERROR >> Mcp2221_I2cRead() returned: " << result << "\n";
    SetEvent(gErrorEvent);
    return;
  }
  std::swap(i2cData[0], i2cData[1]);
  (*lp_log_file) << *((int16_t*)i2cData) << "\r\n";
  lp_log_file->flush();
  step++;
  std::cout << "\r          \r";
  std::cout << step;
  std::cout.flush();
}

void StartRegistration(unsigned int Period, std::fstream &log_file)
{
  HANDLE hTimer = NULL;
  HANDLE hTimerQueue = NULL;
  // Use an event object to track the TimerRoutine execution
  gErrorEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
  if (gErrorEvent == NULL)
  {
    printf("CreateEvent failed (%d)\n", GetLastError());
    return;
  }
  // Create the timer queue.
  hTimerQueue = CreateTimerQueue();
  if (hTimerQueue == NULL)
  {
    printf("CreateTimerQueue failed (%d)\n", GetLastError());
    return;
  }
  // Set a timer to call the timer routine in 10 seconds.
  if (!CreateTimerQueueTimer(&hTimer, hTimerQueue,
  (WAITORTIMERCALLBACK)TimerRoutine, &log_file, 0, Period, 0))
  {
    printf("CreateTimerQueueTimer failed (%d)\n", GetLastError());
    return;
  }
  printf("Call timer routine in %d ms.\n", Period);
  std::cout << "Press " << STOP_CHAR << " to stop\n";
  std::cin.sync(); 
  for (;;)
  {
    DWORD res = WaitForSingleObject(gErrorEvent, Period);
    if (res == WAIT_OBJECT_0)
    {
      std::cerr << "An error occurred during registration.\r\n";
      break;
    }
    if (res == WAIT_TIMEOUT)
    {
      if (_kbhit())
      {
        int c = _getch();
        c = toupper(c);
        if (c == STOP_CHAR)
        {
          std::cout << "\r\n" << STOP_CHAR << " pressed. Stop.\n";
          break;
        }
      }
      continue;
    }
    printf("\nWaitForSingleObject failed (%d)\n", GetLastError());
    break;
  }
  // Delete all timers in the timer queue.
  log_file.flush();
  std::cout.flush();
//  if (!DeleteTimerQueue(hTimerQueue))
  if (!DeleteTimerQueueEx(hTimerQueue, INVALID_HANDLE_VALUE)) // the function waits for all callback functions to complete before returning.
  {
    printf("DeleteTimerQueueEx failed (%d)\n", GetLastError());
  }
  CloseHandle(gErrorEvent);
  return;
}

int main(int argc, char *argv[])
{
  double ShuntVolCoeff = 0; // Коэффициент для пересчета в ток
  double BusVolCoeff = 0; // Коэффициент для пересчета в напряжение
  wchar_t libVersion[64]; // Версия библиотеки mcp2221_dll_um_x86.dll
  wchar_t serialNumber[30 + 1]; // factory serial number of the device or USB Serial Number Descriptor
  unsigned int Period = 0; // Период опроса INA226 в мс
  unsigned int MCP2221_VID = 0; // The vendor ID of the MCP2221 to connect to.(Microchip default = 0x4D8)
  unsigned int MCP2221_PID = 0; // The product ID of the MCP2221 to connect to. Microchip default = 0xDD)
  unsigned int INA226ConfB1 = 0; // 0b01001111 / 79 / 0x4F Первый (старший) байт конфигурации INA226
  unsigned int INA226ConfB2 = 0; // 0b00100111 / 39 / 0x27 Второй (младший) байт конфигурации INA226
  bool useSN = false;
  if (argc < 3)
  {
    std::cerr << "Version 1." << VER_NUM << ", build " << cur_date << "\r\n";
    std::cerr << "Too few command-line arguments!\r\n";
    std::cerr << "Usage:\r\nSSDPower conf_file_name log_file_name\r\n\r\n";
    std::cerr << "conf_file_name  Name of configuration file.\r\n";
    std::cerr << "log_file_name   Name (without extension) of raw data (.log), converted data (.dat) and result (.txt) files.\r\n";
    ExitProcess(0);
  }
  std::ifstream conf_file(argv[1]);
  if (!conf_file.good())
  {
    std::cerr << "Can not open configuration file " << argv[1] << "! Exit.\r\n";
    ExitProcess(0);
  }
  std::string serialNumber_conf;
  conf_file >> serialNumber_conf;
  if (serialNumber_conf.compare(NO_SN_LABEL) == 0)
  {
    std::cout << "Do not use the serial number.\n";
  }
  else
  {
    useSN = true;
    std::cout << "Config Serial Number: " << serialNumber_conf << "\n";
  }
  conf_file >> Period;
  if (Period == 0)
  {
    std::cerr << "Period = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "Period = " << Period << "\r\n";
  }
  conf_file >> ShuntVolCoeff;
  if (ShuntVolCoeff == 0)
  {
    std::cerr << "ShuntVolCoeff = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "ShuntVolCoeff = " << ShuntVolCoeff << "\r\n";
  }
  conf_file >> BusVolCoeff;
  if (BusVolCoeff == 0)
  {
    std::cerr << "BusVolCoeff = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "BusVolCoeff = " << BusVolCoeff << "\r\n";
  }
  conf_file >> std::hex >> MCP2221_VID;
  if (MCP2221_VID == 0)
  {
    std::cerr << "MCP2221_VID = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "MCP2221_VID = " << std::hex << std::showbase << MCP2221_VID << "\r\n";
  }
  conf_file >> std::hex >> MCP2221_PID;
  if (MCP2221_PID == 0)
  {
    std::cerr << "MCP2221_PID = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "MCP2221_PID = " << std::hex << std::showbase << MCP2221_PID << "\r\n";
  }
  conf_file >> std::hex >> slaveAddressINA226;
  if (slaveAddressINA226 == 0)
  {
    std::cerr << "slaveAddressINA226 = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "slaveAddressINA226 = " << std::hex << std::showbase << slaveAddressINA226 << "\r\n";
  }
  conf_file >> std::hex >> INA226ConfB1;
  if (INA226ConfB1 == 0)
  {
    std::cerr << "INA226ConfB1 = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "INA226ConfB1 = " << std::hex << std::showbase << INA226ConfB1 << "\r\n";
  }
  conf_file >> std::hex >> INA226ConfB2;
  if (INA226ConfB2 == 0)
  {
    std::cerr << "INA226ConfB2 = 0! Exit.\r\n";
    ExitProcess(0);
  }
  else
  {
    std::cout << "INA226ConfB2 = " << std::hex << std::showbase << INA226ConfB2 << "\r\n";
  }
  std::cout << std::dec << std::noshowbase;
  std::string log_file_name(argv[2]);
  log_file_name += ".log";
  std::fstream log_file(log_file_name, std::ios::out | std::ios::in | std::ios::trunc | std::ios::binary);
  if (!log_file.good())
  {
    std::cerr << "Can not open log file " << log_file_name << "! Exit.\r\n";
    ExitProcess(0);
  }
  result = Mcp2221_GetLibraryVersion(libVersion);
	if (result == E_NO_ERR)
	{
		std::wcout << "Library Version: " << libVersion << "\n";
    unsigned int numberOfDevices = 0;
		result = Mcp2221_GetConnectedDevices(MCP2221_VID, MCP2221_PID, &numberOfDevices);
		if (result == E_NO_ERR)
		{
			std::cout << "Number of Devices: " << numberOfDevices << "\n";
			if (numberOfDevices > 0)
			{
        for (unsigned int mcpIndex = 0; mcpIndex < numberOfDevices; mcpIndex++)
        {
          std::cout << "Try MCP2221 #" << (mcpIndex + 1) << "\n";
          mcpHandle = Mcp2221_OpenByIndex(DEFAULT_VID, DEFAULT_PID, mcpIndex);
				  result = Mcp2221_GetLastError();
          if (result != E_NO_ERR)
          {
            std::cout << "ERROR >> Mcp2221_OpenByIndex() returned: " << result << "\n";
            mcpHandle = 0;
            break;
          }
          result = Mcp2221_GetFactorySerialNumber(mcpHandle, serialNumber);
          if (result != E_NO_ERR)
          {
            std::cout << "ERROR >> Mcp2221_GetFactorySerialNumber() returned: " << result << "\n";
            mcpHandle = 0;
            break;
          }
          else
          {
            std::wcout << "Factory Serial Number: " << serialNumber << "\n";
          }
          result = Mcp2221_GetSerialNumberDescriptor(mcpHandle, serialNumber);
          if (result != E_NO_ERR)
          {
            std::cout << "ERROR >> Mcp2221_GetSerialNumberDescriptor() returned: " << result << "\n";
            mcpHandle = 0;
            break;
          }
          else
          {
            std::wcout << "Serial Number Descriptor: " << serialNumber << "\n";
          }
          if (useSN) // Сверяем серийный номер
          {
            std::wstring serialNumber_dev_w(serialNumber);
            std::string serialNumber_dev(serialNumber_dev_w.begin(), serialNumber_dev_w.end());
            if (serialNumber_conf.compare(serialNumber_dev) == 0)
            {
              std::cout << "Serial Numbers match!\n";
              break; // Выходим из цикла перебора, так как серийный номер совпал
            }
            else
            {
              std::cout << "Serial Numbers don't match!\n";
              Mcp2221_Close(mcpHandle);
              mcpHandle = 0; // Продолжаем цикл перебора, так как серийный номер не совпал
            }
          }
          else
          {
            break; // Выходим из цикла перебора, так как не нужно сверять серийный номер
          }
        }
        if (mcpHandle != 0) // Нашли нужный экземпляр MCP2221
        {
          // Set the I2C speed to 100000bps.
          result = Mcp2221_SetSpeed(mcpHandle, 100000);
          if (result == E_NO_ERR)
          {
            i2cData[0] = INA226ManIDReg;
            result = Mcp2221_I2cWrite(mcpHandle, 1, slaveAddressINA226, use7bitAddress, i2cData);
            if (result != E_NO_ERR)
            {
              std::cout << "ERROR >> (INA226ManIDReg) Mcp2221_I2cWrite() returned: " << result << "\n";
              result = Mcp2221_Close(mcpHandle);
              return result;
            }
            result = Mcp2221_I2cRead(mcpHandle, 2, slaveAddressINA226, use7bitAddress, i2cData);
            if (result != E_NO_ERR)
            {
              std::cout << "ERROR >> (INA226ManIDReg) Mcp2221_I2cRead() returned: " << result << "\n";
              result = Mcp2221_Close(mcpHandle);
              return result;
            }
            //            int id = *((int*)i2cData);
            std::cout << "INA226 Manufacturer ID Register: " << i2cData[0] << i2cData[1];
            std::cout << " or " << std::hex << int(i2cData[0]) << int(i2cData[1]) << "\n" << std::dec;
            i2cData[0] = INA226ConfReg;// Configuration Register Pointer Address 
            i2cData[1] = INA226ConfB1; // Первый (старший) байт конфигурации
            i2cData[2] = INA226ConfB2; // Второй (младший) байт конфигурации
            result = Mcp2221_I2cWrite(mcpHandle, 3, slaveAddressINA226, use7bitAddress, i2cData);
            if (result != E_NO_ERR)
            {
              std::cout << "ERROR >> (INA226ConfReg) Mcp2221_I2cWrite() returned: " << result << "\n";
              result = Mcp2221_Close(mcpHandle);
              return result;
            }
            StartRegistration(Period, log_file);
            result = Mcp2221_Close(mcpHandle);
            log_file.seekg(0);
            double current;
            double voltage;
            log_file >> current >> voltage;
            if (log_file.eof()) // Ошибка чтения - нет данных
            {
              std::cerr << "\nNo data in log file: " << argv[2] << "! Exit.\r\n";
              log_file.close();
              ExitProcess(0);
            }
            double current_real = current * ShuntVolCoeff; // Реальное значение тока, А
            double current_max = current_real; // Максимальное значение тока, А
            double voltage_real = voltage * BusVolCoeff; // Реальное значение напряжения, В
            double current_sum = current_real; // Сумма токов
            double voltage_sum = voltage_real; // Сумма напряжений
            double power = current_real * voltage_real / 2.0; // Значение мощности, первое значение мощности, делим на 2
            double power_sum = 0; // Сумма мощностей
            double time_step = (double)Period / (double)1000.0; // Интервал между опросами в секундах
            double time_point = 0; // Время с начала для текущей точки в секундах
            std::string res_file_name(argv[2]);
            res_file_name += ".txt";
            std::fstream res_file(res_file_name, std::ios::out | std::ios::in | std::ios::trunc | std::ios::binary);
            if (!res_file.good())
            {
              std::cerr << "Can not open result file " << res_file_name << "! Exit.\r\n";
              log_file.close();
              ExitProcess(0);
            }
            std::string dat_file_name(argv[2]);
            dat_file_name += ".dat";
            std::fstream dat_file(dat_file_name, std::ios::out | std::ios::in | std::ios::trunc | std::ios::binary);
            if (!dat_file.good())
            {
              std::cerr << "Can not open data file " << dat_file_name << "! Exit.\r\n";
              res_file.close();
              log_file.close();
              ExitProcess(0);
            }
            dat_file << "Time (s)\tCurrent (A)\tVoltage (V)\r\n";
            int i = 1; // Число записанных значений
            for (; ; i++)
            {
              dat_file << time_point << '\t' << current_real << '\t' << voltage_real << "\r\n";
              time_point = i * time_step; 
              log_file >> current >> voltage;
              if (log_file.eof()) // В предыдущий раз были прочитаны последние значения
              {
                if (i != 1)
                {
                  power_sum += power / 2.0; // Последнее значение мощности, делим на 2
                }
                break;
              }
              power_sum += power;
              current_real = current * ShuntVolCoeff; // Реальное значение тока, А
              current_max = max(current_max, current_real); // Максимальное значение тока, А
              voltage_real = voltage * BusVolCoeff; // Реальное значение напряжения, В
              current_sum += current_real; // Сумма токов
              voltage_sum += voltage_real; // Сумма напряжений
              power = current_real * voltage_real; // Текущее значение мощности
            }
            double time_interval = time_step * (double)(i - 1);
            power_sum *= time_step; // Умножаем на интервал в c, получаем энергию в Вт*с
            std::cout << "\nNumber of points: " << i << "\n";
            std::cout << "Interval: " << time_interval << " s\n";
            std::cout << "Average current: " << current_sum / (double)(i) << " A\n";
            std::cout << "Maximum current: " << current_max << " A\n";
            std::cout << "Average voltage: " << voltage_sum / (double)(i) << " V\n";
            std::cout << "Energy: " << power_sum << " W*s\n";
            res_file << "Number of points: " << i << "\r\n";
            res_file << "Interval: " << time_interval << " s\r\n";
            res_file << "Average current: " << current_sum / (double)(i) << " A\r\n";
            res_file << "Maximum current: " << current_max << " A\r\n";
            res_file << "Average voltage: " << voltage_sum / (double)(i) << " V\r\n";
            res_file << "Energy: " << power_sum << " W*s\r\n";
            res_file.close();
            log_file.close();
            dat_file.close();
            return result;
          }
				  else
				  {
					  std::cout << "ERROR >> Mcp2221_SetSpeed() returned: " << result << "\n";
				  }
				  result = Mcp2221_Close(mcpHandle);
			  }
				else
				{
          std::cerr << "ERROR target MCP2221 not found!\n";
				}
			}
			else
			{
				std::cout << "ERROR >> No devices connected !\n" << "\n";
			}
		}
		else
		{
			std::cout << "ERROR >> Mcp2221_GetConnectedDevices() returned: " << result << "\n";
		}
	}
	else
	{
		std::cout << "ERROR >> Mcp2221_GetLibraryVersion() returned: " << result << "\n";
	}
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu


