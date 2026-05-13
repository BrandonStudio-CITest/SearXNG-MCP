. ./tests/test.ps1

$tests = @(
    [Test]::new("Inspector initialized, MCP server connected."),
    [Test]::new("MCP server returns valid JSON."),
    [Test]::new("MCP server lists tools correctly."),
    [Test]::new("'get_engines' tool works."),
    [Test]::new("'search' tool works.")
)

$url = "$env:CF_WORKER_URL/mcp"
$code = RunTest -Name "Cloudflare Worker" -Tests $tests -Command "--transport http $url"

exit $code
