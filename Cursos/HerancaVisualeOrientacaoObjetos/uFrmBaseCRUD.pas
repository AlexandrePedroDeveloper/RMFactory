unit uFrmBaseCRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmBaseForm, Data.DB, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.Generics.Collections, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList;

type
  TFrmBaseCRUD = class(TFrmBaseForm)
    StatusBar1: TStatusBar;
    DsQuery: TDataSource;
    DsCrud: TDataSource;
    ImgActions: TImageList;
    Img: TImageList;
    ActionList1: TActionList;
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
    ButtonedEdit1: TButtonedEdit;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    DbGrQuery: TDBGrid;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

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

procedure TFrmBaseCRUD.DOAfterScroll(DataSet: TDataSet);
begin
  if not DsQuery.DataSet.IsEmpty then
  begin
    DsCrud.DataSet.Filter := GetKeyFiled+' = '+DsQuery.DataSet.FieldByName(GetQueryKeyFiled).AsString;
    DsCrud.DataSet.Filtered := True;
    if not DsCrud.DataSet.Active then DsCrud.DataSet.Open;
    StatusBar1.SimpleText := 'Total de Registros: '+IntToStr(DsQuery.DataSet.RecordCount);
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
