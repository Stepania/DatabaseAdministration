use stockauction;

/* Indexes

1. An index on the CattleLot table to speed up queries for agents on auction days.
 */
create index idx_cattlelot on CattleLot(agent, seller, buyer, auctionDay, lotnumber asc, auctioneer);
show indexes in cattleLot;

 /* 2. An index on the SheepLot table to speed up queries for agents on auction days. */
create index idx_agent on SheepLot(agent, auctioneer, lotnumber, buyer, seller, auctionday);
show indexes in sheepLot;

  /* 3. An index useful for tracking particular clients attending auctions. There also needs to be a script written to rebuild the indices. */
create index idx_clientId on AuctionClientAtAuction(clientID, clientNumber, auctionid asc);
show indexes in AuctionClientAtAuction;

/* !!! There also needs to be a script written to rebuild the indices. */
optimize table AuctionClientAtAuction;
REPAIR TABLE AuctionClientAtAuction QUICK;