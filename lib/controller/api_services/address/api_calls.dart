import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/address.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class AddressApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<bool> addAddress(Address address) async {
    final token = await getToken();
    print(address.toJson(address));
    try {
      final response = await dio.post(
        ApiEndPoints.addNewAddress,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          },
        ),
        data: address.toJson(address),
      );
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> updateAddress(Address address) async {
    final token = await getToken();
    try {
      final response = await dio.put(
        '${ApiEndPoints.updateAddress}${address.addressId}',
        data: address.toJson(address),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<List<Address>> fetchAllAddresses() async {
    final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getAllAddresses,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['addressList'] as List;
        List<Address> addresses = [];
        for (int i = 0; i < result.length; i++) {
          final address = Address.fromJson(result[i]);
          addresses.add(address);
        }
        return addresses;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Address?> getAddressById(int addressId) async {
    try {
      final token = await getToken();
      final response = await dio.get(
        '${ApiEndPoints.getAddressById}$addressId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['address'];
        final address = Address.fromJson(result);
        return address;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
