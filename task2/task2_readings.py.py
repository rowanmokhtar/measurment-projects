import serial
import csv
import time


ser = serial.Serial('COM7', 9600)
time.sleep(2)

filename = "task2.csv"

with open(filename, mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Time", "Distance (cm)"])

    print("Recording data ")

    try:
        while True:
            if ser.in_waiting > 0:
                line = ser.readline().decode('utf-8', errors='ignore').strip()

            
                if line.startswith("Distance:"):
                    try:
                        value = float(line.split(":")[1].replace("cm", "").strip())
                        current_time = time.strftime("%H:%M:%S")
                        writer.writerow([current_time, value])
                        print(f"{current_time} -> {value} cm")
                    except ValueError:
                        continue
                elif "error" in line.lower():
                    print("error")
                    continue

    except KeyboardInterrupt:
        print("\nStopped by user.")
        ser.close()
        print(f"Data saved successfully to {filename}")