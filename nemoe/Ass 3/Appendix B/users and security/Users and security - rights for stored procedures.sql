use stockauction;

-- Give the appropriate users the rights to run the stored procedures from Appendix A
grant execute on procedure stockauction.NewAuction_sp to 'AuctionCreator'@'localhost';

grant execute on procedure stockauction.LoadClientsAtAuction_sp to 'ClientLoader'@'localhost';
grant execute on procedure stockauction.LoadClientsAtAuction_sp to ClientData_loader;

grant execute on procedure stockauction.LoadAuctionPresales_sp to 'StockLoader'@'localhost';

grant execute on procedure stockauction.LoadAuctionSales_sp to 'AuctionDayDataEntry'@'localhost';
grant execute on procedure stockauction.LoadAuctionSales_sp to AuctionDayData_entry;

grant execute on procedure stockauction.LoadClientsAtAuction_sp to 'AuctionDaySupervisor'@'localhost';
grant execute on procedure stockauction.LoadAuctionPresales_sp to 'AuctionDaySupervisor'@'localhost';
grant execute on procedure stockauction.LoadAuctionSales_sp to 'AuctionDaySupervisor'@'localhost';

grant execute on procedure stockauction.NewAuction_sp to 'SaleDayAdmin'@'localhost';
grant execute on procedure stockauction.LoadClientsAtAuction_sp to 'SaleDayAdmin'@'localhost';
grant execute on procedure stockauction.LoadAuctionSales_sp to 'SaleDayAdmin'@'localhost';
grant execute on procedure stockauction.LoadAuctionPresales_sp to 'SaleDayAdmin'@'localhost';
grant execute on procedure stockauction.TotalLotsValueBought_sp to 'SaleDayAdmin'@'localhost';
grant execute on procedure stockauction.TotalLotsValueSold_sp to 'SaleDayAdmin'@'localhost';
