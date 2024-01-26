Attribute VB_Name = "Module1"
Sub yr_change_percent_totalvol()
    Dim ws As Worksheet
    Dim ticker As String
    Dim total_volume As Double
    Dim Lrow As Double
    Dim total_close As Double
    Dim total_open As Double
    
    For Each ws In Worksheets

        total_volume = 0
        total_close = 0
        total_open = 0
        Summary_Table_ticker_row = 2
        
        'Total Stock Volume
        ws.Range("I1") = "ticker"
        ws.Range("J1") = "Yearly Change"
        ws.Range("K1") = "Percent Change"
        ws.Range("L1") = "Total Stock Volume"
        
        Lrow = ws.Cells(Rows.Count, 7).End(xlUp).Row
        
        'loop over calculating stock volume
        For i = 2 To Lrow
            
            If ws.Cells(i - 1, 1).Value <> ws.Cells(i, 1).Value Then
                first_open = ws.Cells(i, 3).Value
            ElseIf ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                last_close = ws.Cells(i, 6).Value
                yearly_change = last_close - first_open
                
                percent_change = ((yearly_change) / first_open) * 100
                
                total_volume = total_volume + ws.Cells(i, 7).Value
                
                ws.Range("L" & Summary_Table_ticker_row).Value = total_volume
                ws.Range("I" & Summary_Table_ticker_row).Value = ws.Cells(i, 1)
                ws.Range("J" & Summary_Table_ticker_row).Value = yearly_change
                ws.Range("K" & Summary_Table_ticker_row).Value = percent_change
                
                Summary_Table_ticker_row = Summary_Table_ticker_row + 1
                
                'reset
                total_volume = 0
            Else
                total_volume = total_volume + ws.Cells(i, 7).Value
            End If
        Next i
    Next ws
    
End Sub
Sub max_min():
    Dim col As Range
    
    For Each ws In Worksheets
        ws.Range("N2").Value = "Greatest % increase"
        ws.Range("N3").Value = "Greatest % decrease"
        ws.Range("N4").Value = "Greatest volume"
        ws.Range("O1").Value = "value"
        ws.Range("P1").Value = "Ticker"
    
        max_per = ws.Cells(2, 11).Value
        Min_per = ws.Cells(2, 11).Value
        max_vol = ws.Cells(2, 12).Value
        
        Lrow = ws.Cells(Rows.Count, 7).End(xlUp).Row
        
        For i = 2 To Lrow
            If ws.Cells(i, 11).Value > max_per Then
                max_per = ws.Cells(i, 11).Value
                loc_per = ws.Cells(i, 9).Value
            End If
            
            If ws.Cells(i, 11).Value < Min_per Then
                Min_per = ws.Cells(i, 11).Value
                loc_min_per = ws.Cells(i, 9).Value
            End If
                
            If ws.Cells(i, 12).Value > max_vol Then
                max_vol = ws.Cells(i, 12).Value
                loc_vol = ws.Cells(i, 9).Value
            End If
        Next i
        
        ws.Range("O2").Value = max_per
        ws.Range("p2").Value = loc_per
        
        ws.Range("O3").Value = Min_per
        ws.Range("P3").Value = loc_min_per
        
        ws.Range("O4").Value = max_vol
        ws.Range("P4").Value = loc_vol
        
        ws.Range("J:J").NumberFormat = "$#,##0.00"
    Next ws
    
End Sub

