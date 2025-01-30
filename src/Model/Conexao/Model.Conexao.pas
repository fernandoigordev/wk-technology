unit Model.Conexao;

interface

uses
  FireDAC.Comp.Client,
  FireDAC.Phys.MySQL,
  FireDAC.Stan.Def,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Async,
  FireDAC.Comp.UI;

const
  CS_NOME_ARQUIVO_CONFIGURACAO = 'Configuracao.ini';

type

TModelConexao = class
private
  FConexao: TFDConnection;
  FFDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
  FFDGUIxWaitCursor: TFDGUIxWaitCursor;

  class var FModelConexao: TModelConexao;
  constructor Create;
  procedure ConfigurarConexao;
public
  class function Instance: TModelConexao;
  destructor Destroy;override;

  function GetQuery: TFDQuery;
end;

implementation

uses
  System.IniFiles, System.SysUtils;

{ TModelConexao }

procedure TModelConexao.ConfigurarConexao;
var
  LArquivoINI: TIniFile;
  LCaminhoArquivoConfiguracao: String;
begin
  LCaminhoArquivoConfiguracao := Concat(ExtractFilePath(ParamStr(0)), CS_NOME_ARQUIVO_CONFIGURACAO);

  if FileExists(LCaminhoArquivoConfiguracao) then
  begin
    LArquivoINI := TIniFile.Create(LCaminhoArquivoConfiguracao);
    try
      Self.FConexao.Params.UserName := LArquivoINI.ReadString('Conexao', 'User_Name', 'Erro ao ler User_Name');
      Self.FConexao.Params.Database := LArquivoINI.ReadString('Conexao', 'Database', 'Erro ao ler Database');
      Self.FConexao.Params.Password := LArquivoINI.ReadString('Conexao', 'Password', 'Erro ao ler Password');
      Self.FConexao.Params.DriverID := LArquivoINI.ReadString('Conexao', 'DriverID', 'Erro ao ler DriverID');
      Self.FConexao.Params.Values['Server'] := LArquivoINI.ReadString('Conexao', 'Server', 'Erro ao ler Server');
      Self.FConexao.Params.Values['Port'] := LArquivoINI.ReadString('Conexao', 'Port', 'Erro ao ler Port');

      Self.FFDPhysMySQLDriverLink.VendorHome := LArquivoINI.ReadString('DriveLink', 'VendorHome', 'Erro ao ler VendorHome');
      Self.FFDPhysMySQLDriverLink.VendorLib := LArquivoINI.ReadString('DriveLink', 'VendorLib', 'Erro ao ler VendorLib');

      Self.FConexao.Connected;
    finally
      LArquivoINI.Free;
    end;
  end
  else
  begin
    raise Exception.Create(Concat('Arquivo de conexão não encontrado em: ', LCaminhoArquivoConfiguracao));
  end;
end;

constructor TModelConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FFDPhysMySQLDriverLink := TFDPhysMySQLDriverLink.Create(nil);
  FFDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
end;

destructor TModelConexao.Destroy;
begin
  FConexao.Connected := False;
  FFDPhysMySQLDriverLink.Free;
  FFDGUIxWaitCursor.Free;
  FConexao.Free;
  inherited;
end;

function TModelConexao.GetQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConexao;
end;

class function TModelConexao.Instance: TModelConexao;
begin
  if not Assigned(FModelConexao) then
  begin
    FModelConexao := TModelConexao.Create;
    FModelConexao.ConfigurarConexao;
  end;
  Result := FModelConexao;
end;

initialization

finalization
  FreeAndNil(TModelConexao.FModelConexao);

end.
