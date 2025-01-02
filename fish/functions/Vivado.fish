function Vivado
    ##############################################################
    # Copyright (c) 1986-2024 Xilinx, Inc.  All rights reserved. #
    ##############################################################
    set -gx XILINX_VIVADO '/opt/Xilinx/Vivado/2022.2'
    if [ -n "$PATH" ]
        set -gx PATH '/opt/Xilinx/Vivado/2022.2/bin:'"$PATH"
    else
        set -gx PATH '/opt/Xilinx/Vivado/2022.2/bin'
    end
    echo "Vivado path set to $XILINX_VIVADO"
end
