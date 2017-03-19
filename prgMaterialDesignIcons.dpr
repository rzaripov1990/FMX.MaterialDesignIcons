program prgMaterialDesignIcons;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.FontGlyphs.Android in 'FMX.FontGlyphs.Android.pas',
  uMain in 'uMain.pas' {FormMain},
  FMX.FontGlyphs in 'FMX.FontGlyphs.pas',
  FMX.MaterialDesignIcons in 'FMX.MaterialDesignIcons.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
