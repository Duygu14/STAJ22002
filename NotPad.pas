unit NotPad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, byzTheBezier,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons, Vcl.ComCtrls, dxBarBuiltInMenu,
  cxControls, cxPC , System.Generics.Collections, System.IOUtils,ShlObj,System.Math;
type
  TNotePad = class(TForm)
    Panel1: TPanel;
    btnNewTab: TcxButton;
    btnReplace: TcxButton;
    btnClose: TcxButton;
    btnSave: TcxButton;
    PageControl: TPageControl;
    Panel2: TPanel;
    btnOpenFile: TcxButton;
    procedure btnNewTabClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender:TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageControlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOpenFileClick(Sender: TObject);
  private
    { Private declarations }
    lgvMemosList : TObjectList<TMemo>;
    TabCounter: Integer;
    FirstTabOpened: Boolean;
    NewMemo: TMemo;
    IsEditingIndex: Integer;  // Düzenleme izni olan sekme indeksini takip eder
    DraggingTab: Boolean;
    DragStartTabIndex: Integer;
 //   ClosedTabNumbers: TList<Integer>; // Kapatýlan sekme numaralarýný tutan liste
  public
    { Public declarations }
  end;
var
  NotePad: TNotePad;
implementation

{$R *.dfm}

procedure TNotePad.btnCloseClick(Sender: TObject);
var
  TabIndex, NewActiveIndex: Integer;
  TabSheet: TTabSheet;
  Memo: TMemo;
begin
  if PageControl.PageCount = 0 then    // Sekme sayýsýný kontrol et
  begin
    MessageDlg('Kapatýlacak bir sekme bulunmamaktadýr.', mtWarning, [mbOK], 0);
    Exit;
  end;

  TabIndex := PageControl.ActivePageIndex;  // Kapatýlacak sekmenin indeksini al
  if (TabIndex < 0) or (TabIndex >= PageControl.PageCount) then
  begin
    MessageDlg('Geçersiz sekme seçimi.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if MessageDlg('Seçmiþ olduðunuz sekme kapatýlacak. Devam etmek ister misiniz?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TabSheet := PageControl.Pages[TabIndex]; // Kapatýlacak sekmeyi al
    if (TabIndex >= 0) and (TabIndex < lgvMemosList.Count) then
    begin
      Memo := lgvMemosList[TabIndex];
      if Assigned(Memo) then
      begin
        Memo.Parent := nil; // Memo'yu arayüzden kaldýr
        lgvMemosList.Delete(TabIndex); // Memo'yu listeden kaldýr
        Memo:=nil;
      end;
    end;
    TabSheet.Free;
    if PageControl.PageCount > 0 then  // Yeni aktif sekmeyi belirle
    begin
      if TabIndex >= PageControl.PageCount then
        NewActiveIndex := PageControl.PageCount - 1
      else
        NewActiveIndex := TabIndex;
      PageControl.ActivePageIndex := NewActiveIndex;
      if (NewActiveIndex >= 0) and (NewActiveIndex < lgvMemosList.Count) then
      begin
        lgvMemosList[NewActiveIndex].Parent := Panel1;
        lgvMemosList[NewActiveIndex].Align := alClient;
      end;
    end;
  end;
end;

//Yeni sekme açma prosedürü
procedure TNotePad.btnNewTabClick(Sender: TObject);
var
  NewTabSheet: TTabSheet;
  NewMemo: TMemo;
  MemoName: string;
  TabName: string;
  I, TabNumber: Integer;
begin
  begin
    TabNumber := TabCounter; // Yeni bir sekme numarasý kullan
    Inc(TabCounter); // Sayacý artýr
  end;
  NewTabSheet := TTabSheet.Create(PageControl);
  NewTabSheet.PageControl := PageControl;
  TabName := 'TabSheet' + IntToStr(TabNumber);
  NewTabSheet.Name := TabName;
  NewTabSheet.Caption := 'Yeni Sekme ' + IntToStr(TabNumber);

  NewMemo := TMemo.Create(Panel1);
  MemoName := 'Memo' + IntToStr(TabNumber);
  NewMemo.Name := MemoName;
  lgvMemosList.Add(NewMemo);
  NewMemo.Parent := Panel1;
  NewMemo.Align := alClient;
  NewMemo.Lines.Clear;
  NewMemo.Visible := True;
  PageControl.ActivePage := NewTabSheet;   // Yeni sekmeyi aktif yap
  // Diðer sekmelerdeki TMemo bileþenlerini ReadOnly yap
  for I := 0 to PageControl.PageCount - 1 do
  begin
    if I <> PageControl.ActivePageIndex then
    begin
      lgvMemosList[I].ReadOnly := True;
    end;
  end;
end;

procedure TNotePad.btnOpenFileClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  NewTab: TTabSheet;
  Memo: TMemo;
  TabIndex: Integer;
begin
  OpenDialog := TOpenDialog.Create(Self);
  try
    OpenDialog.Filter := 'Text Files (*.txt)|*.TXT|All Files (*.*)|*.*';
    OpenDialog.DefaultExt := 'txt';
    if OpenDialog.Execute then
    begin
      NewTab := TTabSheet.Create(PageControl);
      NewTab.PageControl := PageControl;
      NewTab.Caption := ExtractFileName(OpenDialog.FileName); // Sekme baþlýðý dosyanýn adýný gösterir
      Memo := TMemo.Create(Panel1);
      Memo.Parent := Panel1;
      Memo.Align := alClient;
      // Dosya içeriðini oku ve TMemo'ya yükle
      try
        Memo.Lines.LoadFromFile(OpenDialog.FileName);
        lgvMemosList.Add(Memo);
      except
        on E: Exception do
           MessageDlg('Dosya okunurken bir hata oluþtu: ' + E.Message, mtError, [mbOK], 0);
      end;

      PageControl.ActivePage := NewTab;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TNotePad.btnReplaceClick(Sender: TObject);
begin
  if (PageControl.PageCount > 0) then
  begin
    IsEditingIndex := PageControl.ActivePageIndex; // Aktif sekmenin indeksini güncelle
    lgvMemosList[IsEditingIndex].ReadOnly := False;   // Aktif sekmedeki Memo'yu düzenlenebilir yap
  end;
end;

procedure TNotePad.FormCreate(Sender:TObject);
begin
  lgvMemosList := TObjectList<TMemo>.Create();
  TabCounter := 1;
//  ClosedTabNumbers := TList<Integer>.Create;
end;

procedure TNotePad.FormDestroy(Sender: TObject);
begin
  if Assigned(lgvMemosList) then
   FreeAndNil(lgvMemosList);
//  ClosedTabNumbers.Free; // Listeyi serbest býrak
end;

procedure TNotePad.PageControlChange(Sender: TObject);
var
//  NewMemo:TMemo;
  I : Integer;
begin
  if (PageControl.PageCount > 0) then
  begin                         // Sekme deðiþtirildiðinde
    if PageControl.ActivePageIndex = IsEditingIndex -1 then     // Aktif tabdaki Memo'yu düzenlenebilir yap
    begin
      lgvMemosList[PageControl.ActivePageIndex].ReadOnly := False;
    end
    else
    begin
      lgvMemosList[PageControl.ActivePageIndex].ReadOnly := True;
    end;
    for I := 0 to PageControl.PageCount - 1 do
    begin
      lgvMemosList[I].Align := alNone;
      lgvMemosList[I].Parent := nil;
    end;

    lgvMemosList[PageControl.ActivePageIndex].Parent := Panel1;
    lgvMemosList[PageControl.ActivePageIndex].Align := alClient;
  end;
end;

procedure TNotePad.PageControlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DragStartTabIndex := PageControl.IndexOfTabAt(X, Y); //hangi sekmeye týklanmýþ
  DraggingTab := DragStartTabIndex <> - 1;             //sürükleme iþlemi baþlamýþ mý baþlamamýþ mý
end;

procedure TNotePad.PageControlMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  TargetTabIndex: Integer;
begin
  if DraggingTab then
  begin
    TargetTabIndex := PageControl.IndexOfTabAt(X, Y);
    if (TargetTabIndex <> -1) and (TargetTabIndex <> DragStartTabIndex) then
    begin
      lgvMemosList.Exchange(DragStartTabIndex, TargetTabIndex); //lgvMemosList'teki TMemo bileþenlerini yer deðiþtirir
      PageControl.Pages[DragStartTabIndex].PageIndex := TargetTabIndex;// Sekmeleri yer deðiþtirin
      DragStartTabIndex := TargetTabIndex;   // Güncellenmiþ sekme indeksini kaydet
    end;
  end;
end;

procedure TNotePad.PageControlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   DraggingTab := False;  //sürükleme iþlemini sonlandýrmak için kullanýlýr
end;

// Özel bir klasör yolunu almamýzý saðlayan fonksiyon
//SHGetFolderPath özel klasör yolunu almka için
function GetSpecialFolderPath(const CSIDL: Integer): string;
var
  Path: array[0..MAX_PATH] of Char;
begin
  SHGetFolderPath(0, CSIDL, 0, SHGFP_TYPE_CURRENT, @Path[0]);
  Result := Path;
end;

procedure TNotePad.btnSaveClick(Sender: TObject);
var
  ActiveMemo: TMemo;
  SaveDialog: TSaveDialog;
  TabIndex: Integer;
begin
  if PageControl.ActivePage = nil then
  begin
    MessageDlg('Aktif sekme bulunamadý. Lütfen bir sekme açýn.', mtWarning, [mbOK], 0);
    Exit;
  end;
  TabIndex := PageControl.ActivePage.PageIndex;  // Aktif sekmenin indeksini al
  // Aktif sekmeye ait TMemo bileþenini lgvMemosList'ten al
  if (TabIndex >= 0) and (TabIndex < lgvMemosList.Count) then
  begin
    ActiveMemo := lgvMemosList[TabIndex];
  end
  else
  begin
    ActiveMemo := nil;
  end;
  // Eðer memo bileþeni bulunduysa, kaydetme iþlemine geç
  if Assigned(ActiveMemo) then
  begin
    SaveDialog := TSaveDialog.Create(Self);
    try
      SaveDialog.InitialDir := GetSpecialFolderPath(CSIDL_DESKTOP); // Masaüstü yolu
      SaveDialog.Filter := 'Metin dosyalarý (*.txt)|*.txt|Tüm dosyalar (*.*)|*.*';
      SaveDialog.DefaultExt := 'txt';
      SaveDialog.FileName := '';
      if SaveDialog.Execute then
      begin
        ActiveMemo.Lines.SaveToFile(SaveDialog.FileName);
      end;
    finally
      SaveDialog.Free;
    end;
  end
  else
  begin
    ShowMessage('Aktif sekmeye ait memo bileþeni bulunamadý.');
  end;
end;

end.
