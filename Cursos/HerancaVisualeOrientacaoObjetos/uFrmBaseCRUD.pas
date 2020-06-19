unit uFrmBaseCRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmBaseForm, Data.DB, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.Generics.Collections, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmBaseCRUD = class(TFrmBaseForm)
    StBrInfo: TStatusBar;
    DsQuery: TDataSource;
    DsCrud: TDataSource;
    ImgActions: TImageList;
    Img: TImageList;
    Acoes: TActionList;
    PnCaption: TPanel;
    Image1: TImage;
    Label1: TLabel;
    PnTools: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    PC: TPageControl;
    tbCrud: TTabSheet;
    tbQuery: TTabSheet;
    Panel1: TPanel;
    EdtPesquisa: TButtonedEdit;
    DbGrQuery: TDBGrid;
    Ac_Incluir: TAction;
    Ac_Cancelar: TAction;
    Ac_Editar: TAction;
    Ac_Visualizar: TAction;
    Ac_Imprimir: TAction;
    Ac_Excluir: TAction;
    Ac_Salvar: TAction;
    Ac_Fechar: TAction;
    Ac_Anterior: TAction;
    Ac_Primeiro: TAction;
    Ac_Proximo: TAction;
    Ac_Ultimo: TAction;
    SpeedButton12: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    MytesteConnection: TFDConnection;
    ClienteTable: TFDQuery;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Ac_SalvarUpdate(Sender: TObject);
    procedure Ac_IncluirUpdate(Sender: TObject);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure Ac_CancelarExecute(Sender: TObject);

  private
    FCheckUnique: TDictionary<String, String>;
    procedure SetCheckUnique(const Value: TDictionary<String, String>);
    procedure DOAfterScroll(DataSet: TDataSet);
  protected
    //Objeto utlizado na rotina de filtro
    FieldFilter: TField;

    //função que retorno o campo chave do DataSet CRUD
    function GetKeyFiled: String;virtual;abstract;

    //Função que retorna o nome do campo chave para filtrar o registro no DataSet de CRUD
    function GetQueryKeyFiled: String;virtual;abstract;

    //procedure que carrega a permissao do usuario logado para o forlumario em questao
    procedure LoadPermissao;virtual;

    //procedure que carrega as restricoes dos campos do formulario em questao para o usuario logado
    procedure LoadRestricao;virtual;

    //Função que verifique a existencia de registro já cadastrado com base nos campos informados em FCheckUnique
    function DoCheckUnique: Boolean;virtual;
  public
    { Public declarations }
    property CheckUnique: TDictionary<String, String> read FCheckUnique write SetCheckUnique;
  end;

var
  FrmBaseCRUD: TFrmBaseCRUD;

implementation

{$R *.dfm}

{ TFrmBaseCRUD }


{ TFrmBaseCRUD }

procedure TFrmBaseCRUD.Ac_CancelarExecute(Sender: TObject);
begin
  inherited;
  DsCrud.DataSet.Cancel;
end;

procedure TFrmBaseCRUD.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
   DsCrud.DataSet.Open;
   DsCrud.DataSet.Insert;
end;

procedure TFrmBaseCRUD.Ac_IncluirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not (DsCrud.State in [dsInsert, dsEdit]);
end;

procedure TFrmBaseCRUD.Ac_SalvarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := DsCrud.State in [dsInsert, dsEdit];
end;

procedure TFrmBaseCRUD.DOAfterScroll(DataSet: TDataSet);
begin
  if not DsQuery.DataSet.IsEmpty then
  begin
    DsCrud.DataSet.Filter := GetKeyFiled+' = '+DsQuery.DataSet.FieldByName(GetQueryKeyFiled).AsString;
    DsCrud.DataSet.Filtered := True;
    if not DsCrud.DataSet.Active then DsCrud.DataSet.Open;
    StBrInfo.SimpleText := 'Total de Registros: '+IntToStr(DsQuery.DataSet.RecordCount);
  end;
end;

function TFrmBaseCRUD.DoCheckUnique: Boolean;
begin

end;

procedure TFrmBaseCRUD.FormCreate(Sender: TObject);
begin
  inherited;
  FCheckUnique := TDictionary<String, String>.Create;
  DsQuery.DataSet.AfterScroll := DOAfterScroll;
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

procedure TFrmBaseCRUD.SetCheckUnique(const Value: TDictionary<String, String>);
begin
  FCheckUnique := Value;
end;

end.
