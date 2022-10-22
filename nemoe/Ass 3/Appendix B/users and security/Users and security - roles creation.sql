use stockauction;

-- Create application roles equivalent to the ClientLoader, AuctionDayDataEntry and Reporter users. 

create role
ClientData_loader,
AuctionDayData_entry,
reporter_reader;

grant insert, update on stockauction.auctionclient to ClientData_loader;
grant insert, update on stockauction.auctionclientatauction to ClientData_loader;

grant update on stockauction.sheeplot to AuctionDayData_entry;
grant update on stockauction.cattlelot to AuctionDayData_entry;

grant select on stockauction.* to reporter_reader;

-- i'm not usre if we need this but it seems logical to have users assigned roles
grant ClientData_loader to 'ClientLoader'@'localhost';
grant AuctionDayData_entry to 'AuctionDayDataEntry'@'localhost';
grant reporter_reader to 'Reporter'@'localhost';

-- testing
show grants for ClientData_loader;
show grants for AuctionDayData_entry;
show grants for reporter_reader;


