class BaseService {
  static final String rootEndpoint = 'https://ezopurze.herokuapp.com';

  static final String loginRoot = rootEndpoint + "/api/auth/login";
  static final String regiserRoot = rootEndpoint + "/api/register";
  // static final String profileRoot = root

  static final String forgotPassword =
      rootEndpoint + '/api/auth/forgot-password';
  static final String viewAllTransaction =
      rootEndpoint + '/api/btc/transactions/lists';
  static final String sendBTC = rootEndpoint + '/api/btc/send/btc';
  static final String addBank =
      rootEndpoint + '/api/add/account/60417a267999dd000435b98a';
  static final String getFaq = rootEndpoint + '/api/faq';
  static final String getTransaction =
      rootEndpoint + '/api/buy-sells/user/buy-sell';
  static final String walletState = rootEndpoint + '/api/btc/wallet';
}
