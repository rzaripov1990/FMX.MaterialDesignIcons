unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.MultiView, FMX.Layouts, FMX.Objects;

type
  TFormMain = class(TForm)
    ToolBar1: TToolBar;
    lbNavBar: TLabel;
    ListView1: TListView;
    MultiView1: TMultiView;
    Layout1: TLayout;
    Text1: TText;
    sbPlus: TSpeedButton;
    sbMinus: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure sbPlusClick(Sender: TObject);
    procedure sbMinusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  FMX.MaterialDesignIcons;

/// <summary> Применить всем дочерним компонентам кастомный стиль </summary>
procedure MaterialDesignIconsApply(const Control: TControl);
var
  i: Integer;
begin
  if Control is TControl then
  begin
    MaterialDesignIconsAssign(TControl(Control));
    if Control is TStyledControl then
      TStyledControl(Control).ApplyStyleLookup;
  end;
  for i := 0 to Control.ControlsCount - 1 do
    MaterialDesignIconsApply(Control.Controls[i]);
end;

/// <summary> настройка ListView </summary>
procedure FontGlyphConfig(const aLV: TListView);
begin
  aLV.CanSwipeDelete := false;
  aLV.ItemAppearance.ItemAppearance := 'Custom';
  with aLV.ItemAppearanceObjects.ItemObjects do
  begin
    Image.Visible := false;
    Accessory.Visible := false;
    TextButton.Visible := false;
    GlyphButton.Visible := false;

    Text.Visible := true;
    Text.PlaceOffset.X := 40;

    Detail.Visible := true;
    Detail.Width := 30;
    Detail.PlaceOffset.X := 0;
    Detail.TextAlign := TTextAlign.Center;
    Detail.TextColor := $FF3F51B5;
    Detail.Font.Size := 24;
    Detail.Font.Family := MaterialDesignIconsName;
  end;
end;

/// <summary> заполнение ListView </summary>
procedure MenuMake(const aLV: TListView);
const
  MAXARRAY = 5;
  TLVMenuItems: array [0 .. MAXARRAY] of string = ('Будильник', 'Android', 'Apple', 'Зарядка', 'Сердце', 'Звонок');
  TLVMenuItemsSymb: array [0 .. MAXARRAY] of string = (mdi_alarm, mdi_android, mdi_apple, mdi_battery_charging_100,
    mdi_heart, mdi_bell_ring);
var
  i: Integer;
begin
  FontGlyphConfig(aLV);
  for i := Low(TLVMenuItems) to High(TLVMenuItems) do
  begin
    with aLV.Items.Add do
    begin
      Text := TLVMenuItems[i];
      Detail := TLVMenuItemsSymb[i];
      Tag := i;
    end;
  end;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  MaterialDesignIconsApply(ToolBar1);
  lbNavBar.Font.Size := 24;
  sbPlus.Font.Size := 24;
  sbMinus.Font.Size := 24;

  lbNavBar.Text := mdi_menu;
  sbMinus.Text := mdi_minus;
  sbPlus.Text := mdi_plus;

  sbMinus.FontColor := TAlphaColorRec.Blue;
  sbPlus.FontColor := TAlphaColorRec.Green;

  MenuMake(ListView1);

  MaterialDesignIconsAssign(Text1);
  Text1.Font.Size := 20;
  Text1.Text := 'Material Design Icons ' + mdi_alert + sLineBreak +
    'growing icon collection allows designers and developers targeting various platforms to download icons in ' +
    'the format, color and size they need for any project.';
end;

procedure TFormMain.sbMinusClick(Sender: TObject);
begin
  Text1.Font.Size := Text1.Font.Size - 1;
end;

procedure TFormMain.sbPlusClick(Sender: TObject);
begin
  Text1.Font.Size := Text1.Font.Size + 1;
end;

end.
