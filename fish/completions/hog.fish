complete -n "__fish_use_subcommand" -f -c Do -a 'CREATE' -d 'Create the project, replacing it if already existing.'
complete -n "__fish_use_subcommand" -f -c Do -a 'WORKFLOW' -d 'Launches the complete workflow, creates the project if not existing.'
complete -n "__fish_use_subcommand" -f -c Do -a 'CREATEWORKFLOW' -d 'Creates the project -even if existing- and launches the complete workflow.'
complete -n "__fish_use_subcommand" -f -c Do -a 'SIMULATE' -d 'Simulate the project, creating it if not existing.'
complete -n "__fish_use_subcommand" -f -c Do -a 'IMPLEMENT' -d 'Runs the implementation only, the project must already exist and be synthesised.'
complete -n "__fish_use_subcommand" -f -c Do -a 'SYNTHESIS' -d 'Runs the synthesis only, creates the project if not existing.'
complete -n "__fish_use_subcommand" -f -c Do -a 'LIST' -d 'Only list all the projects'

function __hog_list_projects
    set -l projects $(./Hog/Do L | awk '/The projects in this repository are/,EOF {print $0}' | tail -n +2 | cut -d' ' -f 1)
    for project in $projects
        echo $project
    end
end

complete -f -c Do -n "__fish_seen_subcommand_from CREATE" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from WORKFLOW" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from CREATEWORKFLOW" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from SIMULATE" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from IMPLEMENT" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from SYNTHESIS" -k -xa "(__hog_list_projects)"

complete -f -c Do -n "__fish_seen_subcommand_from C" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from W" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from CW" -k -xa "(__hog_list_projects)"
complete -f -c Do -n "__fish_seen_subcommand_from S" -k -xa "(__hog_list_projects)"

complete -c Do -n __fish_no_arguments -o no_bitstream -d "If set, the bitstream file will not be produced."
complete -c Do -n __fish_no_arguments -o recreate -d "If set, the project will be re-created if it already exists."
complete -c Do -n __fish_no_arguments -o no_reset -d "If set, runs (synthesis and implementation) won't be reset before launching them."
complete -c Do -n __fish_no_arguments -o check_syntax -d "If set, the HDL syntax will be checked at the beginning of the workflow."
complete -c Do -n __fish_no_arguments -o synth_only -d "If set, only the synthesis will be performed."
complete -c Do -n __fish_no_arguments -o impl_only -d "If set, only the implementation will be performed. This assumes synthesis should was already done."
complete -c Do -n __fish_no_arguments -o verbose -d "If set, launch the script in verbose mode"
complete -c Do -n __fish_no_arguments -o help -d "Print this message"

# flags which require arguments
complete -c Do -F -n __fish_no_arguments -o lib -d "Compiled simulation library path <>"
complete -c Do -F -n __fish_no_arguments -o ext_path -d "Sets the absolute path for the external libraries. <>"
# complete -c Do -n __fish_no_arguments -o njobs -d "Number of jobs. Default: 4 <4>" -a "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16"
# complete -c Do -n __fish_no_arguments -o simset -d "Simulation sets, separated by commas, to be run. <>"
