unit scanner;
uses Sysutils;


interface

type
    TTokenType = (TOK_NUMBER, TOK_WORD, TOK_LEFTPAREN, TOK_RIGHTPAREN, TOK_SEP);
    TToken = record
        tType: TTokenType;
        value: String;
    end;
    
    TScanState = record
        fileName: String;
        fileHandle: TextFile;
        currChar: UInt32;
        currLine: UInt32;
    end;
    
    PTScanState = ^TScanState;

    procedure startScan(fileName: String, scanState:TScanState);
    procedure stopScan(scanState: TScanState);
    function nextToken(scanState: TScanState): TToken;

implementation
	
end.