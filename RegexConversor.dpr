program RegexConversor;

uses
  System.StartUpCopy,
  FMX.Forms,
  RC.Form.Principal in 'form\RC.Form.Principal.pas' {Form1},
  RC.json.RulesList in 'JSON\RC.json.RulesList.pas',
  Pkg.Json.DTO in 'external\Pkg.Json.DTO.pas',
  RC.json.Rules in 'JSON\RC.json.Rules.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
