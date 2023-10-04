codeunit 50200 "Release_Sales_Document"

{

    trigger OnRun()


    begin

    end;


    // sottoscrizione evento OneBeforePostSalesDoc

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    local procedure OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean; var SkipCheckReleaseRestrictions: Boolean)

    // until
    var
        SalesLine: Record "Sales Line";
        BillToCustomer: Code[20];
        Item: Record Item;
        Error: Boolean;
        CustomerCodeFromLine: Code[20];
    begin

        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.FindSet then
            repeat

                Item.Get(SalesLine."No.");
                CustomerCodeFromLine := SalesLine."No.";
                BillToCustomer := SalesLine."Bill-To Customer No.";

                if CustomerCodeFromLine <> '' then begin
                    if CustomerCodeFromLine <> BillToCustomer then begin
                        Error('Il codice cliente della riga non corrisponde al codice cliente');
                    end;
                end;
            until SalesLine.Next() = 0;


    end;

}

// procedura


// veriricare che le righe di tipo Articolo.
// se in anagrafica dell'articolo è specificato un codice cliente
// allora quel codice deve corrispondere al codice cliente intestata dell'ordine (Bill-To Customer)

// Ciclare tutte  le rige che interessano a noi:
// Type = articolo
// document no = numero dell'ordine
// document type = document type::order
// repeat
// Controllo della riga:
// art.codice cliente <> ''
// art.codice cliente <> Bill-To Customer No
// Errore