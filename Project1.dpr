program Project1;

uses
  Vcl.Forms,
  NotPad in 'NotPad.pas' {NotePad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TNotePad, NotePad);
  Application.Run;
end.
