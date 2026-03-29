#!/bin/bash
#SBATCH --job-name=abacus-run
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --time=6:00:00
#SBATCH --output=abacus_%j.out
#SBATCH --error=abacus_%j.err
#SBATCH --account=hd50944

cd $SLURM_SUBMIT_DIR
source /data/user/hd50944/ABACUS/abacus-develop-LTSv3.10.0_1/toolchain/abacus_env.sh
# =============== 强制设置 MPI 相关环境 ===============
export I_MPI_PMI_LIBRARY=/lib64/libpmi.so          # 根据集群实际情况调整
export OMPI_MCA_pml=ob1
export OMPI_MCA_btl=vader,self,openib

# =============== 并行设置 ===============
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

# =============== 运行命令 ===============
srun --mpi=pmi2 abacus


null
