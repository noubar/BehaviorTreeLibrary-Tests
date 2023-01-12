*** Keywords ***

################
### Metadata ###
################

Write Suite Metadata
    [Documentation]  This keyword writes the metadata for the currently executed suite.
    ...
    Write Metadata Windows Architecture
    Write Metadata IPAddress
    Write Metadata Hostname
    Write Metadata Product Version
    Write Metadata Product CCID