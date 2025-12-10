unit scanner;
uses Sysutils;

interface

type
    TTokenType = (TOK_LITERAL, TOK_IDENTIFIER, TOK_KEYWORD, TOK_LEFTPAREN, TOK_RIGHTPAREN, TOK_SEP, 
    TOK_OPERATOR, TOK_RELATION);

    (*  Tokens passed over to the parser
    *) 

    TToken = record
        tType: TTokenType;
        value: String;
    end;
    
    (*  Scan state record. Holds the actual state of the scanned file.
        As I don't plan to use object pascal at all, this is the way 
        to enclose data that belongs together. 
    *)

    TScanState = record
        fileName: String;
        fileHandle: TextFile;
        currChar: UInt32;
        currLine: UInt32;
        isActive: boolean;
    end;
    
    PTScanState = ^TScanState;

    procedure startScan(fileName: String, scanState:PTScanState);
    procedure stopScan(scanState: PTScanState);
    function nextToken(scanState: PTScanState): TToken;

implementation

	procedure startScan(fileName: String, scanState:PTScanState)
    begin
        TextFile f;
        AssignFile(f, fileName);
        try
            reset(f);
            scanState^.fileName := fileName;
            scanState^.fileHandle := f;
            scanState^.currChar := 0;
            scanState^.currLine := 0;
            scanState^.isActive := true;
        except
            on E: EInOutError do
                writeln('File open error ['+ fileName +']: ', E.Message);
        end;
    end;
    
    procedure stopScan(scanState: PTScanState)
    begin
        CloseFile(scanState^.fileHandle);
        scanState^.isActive := false;
    end;
 
    (*  Traverse the file content ad return the next token that can be extracted.
        Maybe later will be extended to be able to be configured by outside,
        for more and dynamic types of token recognition, but for the moment it 
        will support the token types that are described in TTokenType. 
    *)
    function nextToken(scanState: PTScanState): TToken
    begin
    //TODO:
    end;

end.