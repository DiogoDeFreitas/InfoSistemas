unit untBuscaCep;

interface
uses
  System.JSON, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client, System.Classes,
  REST.Client, IPPeerClient, System.SysUtils;

  function BuscarCEPNoViaCEP(UmCEP: string): TStringList;
implementation

function BuscarCEPNoViaCEP(UmCEP: string): TStringList;
var
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  Endereco: TStringList;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'http://viacep.com.br/ws/' + UmCEP + '/json';
  RESTRequest1.Execute;
  data := RESTResponse1.JSONValue as TJSONObject;
  try
    Endereco := TStringList.Create;
    if Assigned(data) then
    begin
        try
          Endereco.Add(data.Values['logradouro'].Value);
        except
          on Exception do
            Endereco.Add('');
        end;
        try
          Endereco.Add(data.Values['bairro'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;
        try
          Endereco.Add(data.Values['uf'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;
        try
          Endereco.Add(data.Values['localidade'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;
        try
          Endereco.Add(data.Values['complemento'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;
      end;
  finally
    FreeAndNil(data);
  end;
  Result := Endereco;
end;

end.
