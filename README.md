# DC Motor Speed Control Using PID Controller

A MATLAB/Simulink project that models closed-loop DC motor speed regulation using a PID controller and studies the motor-speed response under a load-torque disturbance.

## Project Overview

The project contains two Simulink models:

- `DC_Motor_PID_1000rpm.slx` — reference-tracking model with a target speed of 1000.
- `DC_Load_disturbance.slx` — model intended to examine speed response when a load-torque disturbance is applied.

The controller compares the reference speed with measured motor speed. The resulting error is processed by the PID controller, which adjusts the motor input to reduce the error.

> **Units note:** The reference is intended to represent 1000 RPM. Confirm the sensor/converter output units in the Simulink model before interpreting every logged value as RPM.

## Objectives

- Build and simulate closed-loop DC motor speed control.
- Track a reference speed of 1000.
- Calculate rise time, settling time, percentage overshoot, final speed, and steady-state error.
- Observe the response to a load-torque disturbance.
- Document the model, MATLAB analysis scripts, results, and graphs.

## Tools and Requirements

- MATLAB/Simulink (the supplied report was prepared using MATLAB/Simulink R2024a)
- Required Simulink and Simscape libraries used by the models
- MATLAB scripts included in the repository

## Repository Structure

Keep the file and folder names below aligned with the files actually uploaded to GitHub. If your repository uses numbered folders, keep those folder names and update links in this README accordingly.

```text
DC-Motor-PID-Speed-Control/
├── README.md
├── DC_Motor_PID_1000rpm.slx
├── DC_Load_disturbance.slx
├── Project_Results & graphs.pdf
├── DC_Motor_PID_Technical_Report.pdf
├── MATLAB_Code/
│   ├── DC Motor PID - Performance Analysis.m
│   ├── Transient response.m
│   ├── Load disturbance response.m
│   └── Performance metrics.m
├── 02_Results_and_Graphs/
│   └── results and graphs PDF
├── 05_Screenshots/
│   ├── 01_Speed_Response.png
│   ├── 02_Transient_Response.png
│   ├── 03_Load_Disturbance_Response.png
│   ├── 04_Performance_Metrics.png
│   └── 05_DC_Motor_Perfomance_Outputs.png
├── 03_Technical_Report/
│   └── report files
├── 05_Screenshots/
│   └── screenshots

```

## Simulink Models

### 1. Reference speed control

`DC_Motor_PID_1000rpm.slx` contains a reference Step block, a summing junction, a PID controller, a DC motor/physical plant, speed measurement, feedback, and Scope/output logging. The feedback loop compares actual speed with the reference and corrects the error.

### 2. Load disturbance

`DC_Load_disturbance.slx` is intended to apply a load-torque disturbance and observe how the controller responds. Use the model's actual disturbance settings and logged output when reporting speed dip and recovery.

## How to Run

1. Download or clone this repository.
2. Open MATLAB and set the current folder to the repository root.
3. Open `DC_Motor_PID_1000rpm.slx`.
4. Check the model's reference input, PID gains, motor parameters, solver settings, and stop time.
5. Run the simulation and inspect the speed response in the Scope.
6. Open `DC_Load_disturbance.slx` and run it separately to study the load-disturbance case.
7. Run the MATLAB analysis scripts after the corresponding simulation has completed and the required logged variables are available.
8. Save or export the generated graphs into `02_Results_and_Graphs`.

> The analysis scripts depend on workspace/output variables created by the simulation. Run the appropriate model first and check the variable names used by the script if MATLAB reports a missing field or variable.

## Performance Metrics

The later MATLAB Command Window output recorded for the reference-tracking analysis was:

| Parameter | Recorded value |
|---|---:|
| Reference | 1000 (intended target; confirm units) |
| Rise time | 0.004368 s |
| Settling time | 0.069864 s |
| Percentage overshoot | 4.6788% |
| Final speed | 1000.0005 (signal units) |
| Steady-state error | -0.0005 (signal units) |

These values are taken from the recorded MATLAB output. Some supplied plot annotations show different values, so regenerate the graphs and metrics from the same simulation run before using them as a final, internally consistent set of results.

## Results and Graphs

The repository's results PDF includes:
- Reference speed versus actual speed.
- Transient response with rise time, settling time, and overshoot annotation.
- Motor speed response under load disturbance.
- A performance-metrics table.

The PNG images are stored in `05_Screenshots/`, not `02_Results_and_Graphs/`. If you want images to display directly on the GitHub README, upload them to `05_Screenshots/` using the exact filenames below. GitHub paths are case-sensitive.

### Reference speed response

![DC motor reference speed response](05_Screenshots/01_Speed_Response.png)

### Transient response

![DC motor transient response](05_Screenshots/02_Transient_Response.png)

### Load disturbance response

![DC motor response under load disturbance](05_Screenshots/03_Load_Disturbance_Response.png)

### Performance metrics

![DC motor PID performance metrics](05_Screenshots/04_Performance_Metrics.png)

## MATLAB Code

- `DC Motor PID - Performance Analysis.m` — extracts logged speed data, calculates performance measures, and plots the response.
- `Transient response.m` — generates a transient-response graph with metric annotations.
- `Load disturbance response.m` — plots the load-disturbance speed response from logged data.
- `Performance metrics.m` — creates a table of rise time, settling time, and percentage overshoot.

Make sure each script's expected variable names match the data saved by your current model run.

## Conclusion

This project demonstrates a closed-loop PID control workflow for DC motor speed regulation in MATLAB/Simulink. It includes a reference-tracking model, a separate load-disturbance model, MATLAB analysis scripts, plots, and technical documentation. The recorded reference-tracking output approaches the target with a very small final error. The disturbance response should be interpreted using the actual logged signal and the model's disturbance settings.

## Future Improvements

- Tune PID gains systematically and compare results before and after tuning.
- Compare PID with PI or another controller.
- Test different reference speeds and disturbance magnitudes.
- Quantify the load-induced speed dip and recovery time from logged data.
- Keep all plotted annotations and report tables consistent with one simulation run.

## References

1. MathWorks, [Simulink Documentation](https://www.mathworks.com/help/simulink/).
2. MathWorks, [Simscape Documentation](https://www.mathworks.com/help/simscape/).
3. MathWorks, [PID Controller Block — Simulink](https://www.mathworks.com/help/simulink/slref/pidcontroller.html).
4. K. Ogata, *Modern Control Engineering*, 5th Edition, Prentice Hall, 2010.
5. B. C. Kuo and F. Golnaraghi, *Automatic Control Systems*, 8th Edition, Wiley, 2002.

## Author

**Aditya Dhing**  
Electrical Engineering  
Nirma Institute of Technology

---
