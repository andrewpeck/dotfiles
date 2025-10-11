function Vivado2024p1 --description "Set up Vivado 2024.1"
    set -gx XILINX_VIVADO '/opt/Xilinx/Vivado/2024.1'
    if [ -n "$PATH" ]
        set -gx PATH '/opt/Xilinx/Vivado/2024.1/bin:'"$PATH"
    else
        set -gx PATH '/opt/Xilinx/Vivado/2024.1/bin'
    end
    echo "Vivado path set to $XILINX_VIVADO"
end
