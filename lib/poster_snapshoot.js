var page = require('webpage').create(),
    system = require('system'),
    address;

if (system.args.length < 3 || system.args.length > 4) {
    console.log('Hello World!');
    phantom.exit(1);
} else {
    address = system.args[1];
    output = system.args[2];
    page.open(address, function () {
      page.render(output);
      phantom.exit();
    });
}
