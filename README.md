# 🚀 High-Performance GPU-Accelerated Computing Simulations

**Author:** Scott Lindsay  
**Advisor:** Dr. Jander  
**Project:** Automated Workflow Systems for Physics Simulations on HPC Clusters

## 🧠 Project Overview

This repository contains a sophisticated automated workflow system for running large-scale physics simulations on high-performance computing (HPC) clusters. The system is specifically designed for micromagnetic simulations using MuMax3, with a focus on optimizing GPU resource utilization and automating parameter sweeps.

## 🛠 Core Technologies

- **GPU Computing:** Leveraging NVIDIA GPUs on Dell HPC infrastructure
- **Workflow Automation:** Bash scripting and SLURM workload manager
- **Simulation Software:** MuMax3 for GPU-accelerated micromagnetic simulations
- **Data Processing:** Automated pipelines for simulation result analysis

## 💡 Key Features

### Automated Workflow System
- **Parameter Sweep Automation:** Efficiently generates and manages thousands of simulation configurations
- **Dynamic Configuration Generation:** Automated creation of simulation input files with varying parameters
- **Batch Processing:** SLURM-based job submission system for parallel execution
- **Resource Optimization:** Intelligent job scheduling and GPU utilization

### Simulation Parameters
- Angle variations (0-60 degrees)
- Strain parameters (2.5-120 ppm)
- Pump amplitude configurations
- Phase shift variations
- Bias strength settings

## 📁 Repository Structure

```
.
├── README.md                     # Project documentation
├── scripts/                      # Automation and workflow scripts
│   ├── submit-all.sh            # Batch job submission manager
│   ├── Job_Template.sh          # SLURM job template
│   ├── Change_Inputs.sh         # Parameter sweep generator
│   └── Change_Inputs_Job.sh     # Job-specific parameter modification
├── templates/                    # Base configuration templates
│   └── Base_Starters_Input.txt  # Template configuration file
├── configs/                      # Generated simulation configurations
│   └── [Simulation Configs]     # Parameter-specific configuration files
├── outputs/                      # Simulation results and data
│   └── [Simulation Outputs]     # Generated simulation data
└── docs/                         # Additional documentation
```

## ⚙️ Technical Implementation

### Automated Parameter Generation
The system uses a sophisticated parameter sweep mechanism that:
- Dynamically generates simulation configurations
- Handles multiple parameter dimensions (angle, strain, pump amplitude)
- Creates unique configuration files for each parameter set
- Automates the modification of simulation parameters

### HPC Integration
- SLURM workload manager integration
- GPU resource allocation optimization
- Automated job submission and monitoring
- Efficient data processing pipelines

## 🚀 Getting Started

1. **Prepare Simulation Parameters:**
   ```bash
   cd scripts
   ./Change_Inputs.sh
   ```
   This generates the necessary configuration files for your parameter sweep.

2. **Submit Jobs:**
   ```bash
   ./submit-all.sh
   ```
   Automatically submits all generated configurations to the HPC cluster.

## 🔍 Simulation Workflow Details

The current repository workflow consists of the following steps:

1. **Base Template (`Base_Starters_Input.txt`):**
   Defines all simulation settings and placeholder parameters (e.g., Angle, Pump_Scale).
2. **Parameter Generation (`Change_Inputs.sh`):**
   Reads the base template and creates `.txt` MuMax3 input files for each combination of parameters.
3. **Named Configurations (`Angle=...txt` Files):**
   Input files whose filenames encode their specific parameter values (e.g., `Angle=7deg_StrainEo=0ppm_Phase=0deg_B1=0x_alpha=0x.txt`).
4. **Job Script Creation (`Change_Inputs_Job.sh`):**
   Generates SLURM job scripts (`RunMe_*.sh`) by copying `Job_Template.sh` and injecting the correct input filenames and paths.
5. **SLURM Submission Template (`Job_Template.sh`):**
   Specifies GPU resources, runtime, and module loads (MuMax3, CUDA) for each job.
6. **Batch Submission (`submit-all.sh`):**
   Submits all `RunMe_*.sh` scripts to the HPC cluster using `sbatch` and displays current job queue status.

Once submitted, each job runs MuMax3 on its `.txt` input script, producing `.ovf` output files and time-step data for analysis.

## 📊 Output Management

The system automatically:
- Generates unique configuration files for each parameter set
- Organizes simulation outputs in the `outputs/` directory
- Facilitates efficient data analysis
- Maintains clear parameter tracking

## 📜 License

MIT License

## 🙏 Acknowledgments

Special thanks to Dr. Jander and the OSU College of Engineering HPC team for their support and resources. 