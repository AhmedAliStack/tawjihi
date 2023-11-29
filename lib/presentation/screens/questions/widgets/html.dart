// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlWidget extends StatelessWidget {
  final String htmlData;
  const HtmlWidget({
    Key? key,
    required this.htmlData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      style: {
        "table": Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          alignment: Alignment.topLeft,
        ),
        'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
      },
      onLinkTap: (url, attributes, element) async {
        if (kDebugMode) {
          print(url);
        }
        if (await launchUrl(Uri.parse("$url"))) {
          throw Exception('Could not launch url');
        }
      },
      // customRender: {
      //   "table": (context, child) {
      //     return SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child:
      //           (context.tree as TableLayoutElement).toWidget(context),
      //     );
      //   },
      //   "bird": (RenderContext context, Widget child) {
      //     return TextSpan(text: "🐦");
      //   },
      //   "flutter": (RenderContext context, Widget child) {
      //     return FlutterLogo(
      //       style: (context.tree.element!.attributes['horizontal'] != null)
      //           ? FlutterLogoStyle.horizontal
      //           : FlutterLogoStyle.markOnly,
      //       textColor: context.style.color!,
      //       size: context.style.fontSize!.size! * 5,
      //     );
      //   },
      // },
      // customImageRenders: {
      //   networkSourceMatcher(domains: ["flutter.dev"]):
      //       (context, attributes, element) {
      //     return FlutterLogo(size: 36);
      //   },
      //   networkSourceMatcher(domains: ["mydomain.com"]):
      //       networkImageRender(
      //     headers: {"Custom-Header": "some-value"},
      //     altWidget: (alt) => Text(alt ?? ""),
      //     loadingWidget: () => Text("Loading..."),
      //   ),
      //   // On relative paths starting with /wiki, prefix with a base url
      //   (attr, _) =>
      //           attr["src"] != null && attr["src"]!.startsWith("/wiki"):
      //       networkImageRender(
      //           mapUrl: (url) => "https://upload.wikimedia.org" + url!),
      //   // Custom placeholder image for broken links
      //   networkSourceMatcher():
      //       networkImageRender(altWidget: (_) => FlutterLogo()),
      // },
      // onLinkTap: (url, _, __, ___) {
      //   print("Opening $url...");
      // },
      // onImageTap: (src, _, __, ___) {
      //   print(src);
      // },
      // onImageError: (exception, stackTrace) {
      //   print(exception);
      // },
      onCssParseError: (css, messages) {
        for (var element in messages) {}
        return null;
      },
    );
  }
}
