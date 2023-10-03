tableextension 50200 ACDTE50200 extends Item // ACD + NOME TABELLA OGNI VOLTA CHE CREIAMO UNA TABELLA
{

    fields
    {
        field(50200; "ACD Customer No."; Code[20])
        {
            TableRelation = Customer;
        }
    }


    var
        myInt: Integer;
}