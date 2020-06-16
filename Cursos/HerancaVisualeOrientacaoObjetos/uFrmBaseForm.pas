unit uFrmBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Fadein: TTimer;
    FadeOut: TTimer;
    procedure FadeinTimer(Sender: TObject);
    procedure FadeOutTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetTitulo: String;virtual;abstract;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FadeinTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue + 15;
    FadeIn.Enabled := not (AlphaBlendValue = 255);
end;

procedure TForm1.FadeOutTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue - 15;
  if AlphaBlendValue = 0 then
    Close;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
   VK_ESCAPE: FadeOut.Enabled := true;
   VK_RETURN: Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Caption := GetTitulo;
end;

end.
