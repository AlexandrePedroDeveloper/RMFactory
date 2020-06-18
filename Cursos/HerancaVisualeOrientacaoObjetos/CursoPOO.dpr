program CursoPOO;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uFrmBaseForm in 'uFrmBaseForm.pas' {FrmBase},
  uFrmBaseCRUD in 'uFrmBaseCRUD.pas' {FrmBaseCRUD};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
