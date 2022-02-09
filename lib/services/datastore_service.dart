import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:delivery_timesheet_app/models/ModelProvider.dart';

class DataStoreService {
  Future<void> saveDriver(Driver driver) async {
    try {
      Driver? _user = await getDriver(driver.id);
      if (_user == null) {
        print('DataStore Save');
        //await Amplify.DataStore.clear();
        await Amplify.DataStore.save(driver);
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> saveDelivery(Delivery delivery) async {
    try {
      await Amplify.DataStore.save(delivery);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> removeDelivery(Delivery delivery) async {
    try {
      await Amplify.DataStore.delete(delivery);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Delivery>?> getDeliveries(String driverId) async {
    try {
      List<Delivery> categories = await Amplify.DataStore.query(
          Delivery.classType,
          where: Delivery.DRIVERID.eq(driverId));
      if (categories.length > 0) {
        return categories;
      } else
        return null;
    } catch (e) {
      throw e;
    }
  }

  Future<Driver?> getDriver(String driverId) async {
    try {
      List<Driver> driver = await Amplify.DataStore.query(Driver.classType,
          where: Driver.ID.eq(driverId));
      if (driver.length > 0) {
        return driver.first;
      } else
        print('null');
      return null;
    } catch (e) {
      throw e;
    }
  }
}
