class ApiConstants {
  static const String schemeHttps = 'https';

  static const String _clientId = 'huk49eaZA8b0G17YHsWvxX48mNR83ig1CTCMsyllIs0';
  static const String _clientSecret = 'frontend';

  static const Map<String, dynamic> userAccessLoginParameters = {
    'grant_type': 'password',
    'client_secret': _clientSecret,
    'client_id': _clientId,
  };

  static const Map<String, dynamic> userAccessRefreshParameters = {
    'grant_type': 'refresh_token',
    'client_secret': _clientSecret,
    'client_id': _clientId,
  };

  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectTimeout = Duration(milliseconds: 15000);

  static const String pathKebabStores = '/api/v1/kebabplaces';
  static const String staticContentGeneralWeb = '/api/getStaticContent';
  static const String staticContentLegendWeb = '/api/getLegendContent';
  static const String login = '/oauth/token?_format=json';
  static const String register = '/api/v1/user/register?_format=json';
  static const String activate = '/api/v1/user/register/confirm?_format=json';
  static const String activateResend = '/api/v1/user/register/resend?_format=json';
  static const String refresh = '/oauth/token?_format=json';
}
