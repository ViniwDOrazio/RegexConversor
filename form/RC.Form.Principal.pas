unit RC.Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.ListBox, FMX.Controls.Presentation, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    pConversionType: TPanel;
    cbConversionType: TComboBox;
    lblConversionType: TLabel;
    gpTextos: TGridPanelLayout;
    pOriginalText: TPanel;
    mmoOriginalText: TMemo;
    lblOriginalText: TLabel;
    Panel1: TPanel;
    mmoConversionResult: TMemo;
    lblConversionResult: TLabel;
    procedure mmoOriginalTextPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.mmoOriginalTextPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  //
end;

end.
