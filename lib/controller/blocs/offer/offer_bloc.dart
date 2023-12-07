import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/offers/api_calls.dart';
import 'package:foodiebuddie/model/offer.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc() : super(OfferInitial()) {
    on<GetAllOfferEvent>((event, emit) async {
      final offers = await OfferApiServices().getAllOffers();
      emit(OfferState(offers: offers));
    });
  }
}
