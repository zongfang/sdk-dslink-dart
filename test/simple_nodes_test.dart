@TestOn("vm")
@Timeout(const Duration(seconds: 10))
library dslink.test.vm.nodes.simple;

import "dart:async";

import "package:dslink/broker.dart";
import "package:dslink/server.dart";
import "package:dslink/dslink.dart";
import "package:dslink/io.dart";
import "package:test/test.dart";

import "common.dart";

main() {
  group("SimpleNode", simpleNodeTests);
}

simpleNodeTests() {
  test("retains configs", () {
    var provider = createSimpleNodeProvider(nodes: {
      "Message": {
        r"$name": "A Message",
        r"$type": "string"
      }
    });

    var msg = provider.getNode("/Message");

    expect(msg.configs[r"$name"], equals("A Message"));
    expect(msg.configs[r"$type"], equals("string"));
    expect(msg.getConfig(r"$name"), equals("A Message"));
    expect(msg.getConfig(r"$type"), equals("string"));
    expect(msg.get(r"$name"), equals("A Message"));
    expect(msg.get(r"$type"), equals("string"));
  });

  test("retains attributes", () {
    var provider = createSimpleNodeProvider(nodes: {
      "Message": {
        "@name": "A Message",
        "@type": "string"
      }
    });

    var msg = provider.getNode("/Message");

    expect(msg.attributes["@name"], equals("A Message"));
    expect(msg.attributes["@type"], equals("string"));
    expect(msg.getAttribute("@name"), equals("A Message"));
    expect(msg.getAttribute("@type"), equals("string"));
    expect(msg.get("@name"), equals("A Message"));
    expect(msg.get("@type"), equals("string"));
  });
}
