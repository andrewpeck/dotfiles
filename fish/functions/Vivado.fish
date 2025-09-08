function Vivado2022p2
    set -gx XILINX_VIVADO '/opt/Xilinx/Vivado/2022.2'
    if [ -n "$PATH" ]
        set -gx PATH '/opt/Xilinx/Vivado/2022.2/bin:'"$PATH"
    else
        set -gx PATH '/opt/Xilinx/Vivado/2022.2/bin'
    end
    echo "Vivado path set to $XILINX_VIVADO"
end

function Vivado2024p1
    set -gx XILINX_VIVADO '/opt/Xilinx/Vivado/2024.1'
    if [ -n "$PATH" ]
        set -gx PATH '/opt/Xilinx/Vivado/2024.1/bin:'"$PATH"
    else
        set -gx PATH '/opt/Xilinx/Vivado/2024.1/bin'
    end
    echo "Vivado path set to $XILINX_VIVADO"
end
