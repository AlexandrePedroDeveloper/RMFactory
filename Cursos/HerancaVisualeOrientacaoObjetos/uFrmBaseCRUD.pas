unit uFrmBaseCRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmBaseForm, Vcl.ExtCtrls, Data.DB,
  Vcl.ComCtrls, System.Generics.Collections;

type
  TFrmBaseCRUD = class(TFrmBase)
    StatusBar1: TStatusBar;
    DsQuery: TDataSource;
    DsCrud: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCheckUnique: TDictionary<string, string>;
    procedure SetCheckUnique(const Value: TDictionary<string, string>);
    procedure DoAfterScroll(Dataset: TDataSet);
  protected
    //Objeto utilizado na rotina de filtro
    FieldFilter: TField;

    //função que retorno o campo chave do DataSet CRUD
    function GetKeyField: string; virtual;abstract;

    //função quer retorna o nome do campo chave para filtrar o registro no DataSet de CRUD
    function GetQueryKeyField: string;virtual;abstract;

    //procedure que carrega a permissao do usuario logado para o formulario em questao
    procedure LoadPermissao;virtual;

    //procedure que carrega as restricoes dos campos do formulário em questao para o usuario logado
    procedure LoadRestricao;virtual;

    //funcao que verifique a existencia de registro ja cadastrado com base nos campos informados em FCheckUnique
    function DoCheckUnique: Boolean;virtual;

  public
    { Public declarations }
    property CheckUnique: TDictionary<string,string> read FCheckUnique write SetCheckUnique;
  end;

var
  FrmBaseCRUD: TFrmBaseCRUD;

implementation

{$R *.dfm}

{ TFrmBaseCRUD }

procedure TFrmBaseCRUD.DoAfterScroll(Dataset: TDataSet);
begin
  if not DsQuery.DataSet.IsEmpty then
  begin
    DsCrud.DataSet.Filter := GetKeyField + ' = ' + DsQuery.DataSet.FieldByName(GetQueryKeyField).AsString;
    DsCrud.DataSet.Filtered := True;
    if not DsCrud.DataSet.Active then DsCrud.DataSet.Open;
    StatusBar1.SimpleText := 'Total de Reistros: ' + IntToStr(DsQuery.DataSet.RecordCount);
  end;
end;

function TFrmBaseCRUD.DoCheckUnique: Boolean;
begin

end;

procedure TFrmBaseCRUD.FormCreate(Sender: TObject);
begin
  inherited;
  FCheckUnique := TDictionary<string,string>.Create;
  DsQuery.DataSet.AfterScroll := DoAfterScroll;
end;

procedure TFrmBaseCRUD.FormDestroy(Sender: TObject);
begin
  FCheckUnique.Free;
  inherited;

end;

procedure TFrmBaseCRUD.LoadPermissao;
begin

end;

procedure TFrmBaseCRUD.LoadRestricao;
begin

end;

procedure TFrmBaseCRUD.SetCheckUnique(const Value: TDictionary<string, string>);
begin
  FCheckUnique := Value;
end;

end.
