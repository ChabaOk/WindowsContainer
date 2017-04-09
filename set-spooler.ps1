Configuration ManagePrintServer
{
    param (
        [string[]]$NodeName = 'localhost'
    )

    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
    Node $NodeName
    {
        Service StartSpooler
        {
            Name = "spooler"
            State = "running"
            Ensure = "Present"
        }
    }
}
ManagePrintServer -NodeName localhost -OutputPath C:\mof
Start-DscConfiguration -Path C:\mof -Verbose -wait