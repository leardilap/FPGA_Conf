# FPGA and Flash memory configuration using the Impact batch mode

## Usage
```{r, engine='bash', count_lines}
./fpga_config.sh -f FILENAME [-g]
```

Simply replace FILENAME by the actual name of the file you want to configure.

If the FILENAME has extension .mcs the Flash memory will be configured.

If the FILENAME has extension .bit and the -g option is used the .mcs file is generated from the .bit file.

IF the option -g is not included the .bit file is configured in the FPGA.

Take in mind modifications to the impact_*_tmp.cmd files may be required for your specific system, simply run Impact once using the Graphical mode, and note all lines in the log which have the "Batch" word and write them to your own impact_*_tmp.cmd files.
