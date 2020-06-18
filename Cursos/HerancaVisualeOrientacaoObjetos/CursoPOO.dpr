program CursoPOO;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uFrmBaseForm in 'uFrmBaseForm.pas' {FrmBaseForm},
  uFrmBaseCRUD in 'uFrmBaseCRUD.pas' {FrmBaseCRUD},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
