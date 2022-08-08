program Project1;

uses
  Vcl.Forms,
  untCadastroCliente in 'Cadastro\untCadastroCliente.pas' {Form1},
  untBuscaCep in 'unitAuxiliar\untBuscaCep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
