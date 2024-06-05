using { db } from '../db/schema';

service MainService {
    entity Cities as projection on db.Cities;
    entity Countries as projection on db.Countries;
    entity Users as projection on db.Users;
}
