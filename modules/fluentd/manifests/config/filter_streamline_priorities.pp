class fluentd::config::filter_streamline_priorities (
  $pattern  = '**',
  $priority = 40,
) {

  # see https://tools.ietf.org/html/rfc5424#section-6.2.1
  $replacements = {
    '7' => 'debug',
    '6' => 'info',
    '5' => 'warning',
    '4' => 'warning',
    '3' => 'error',
    '2' => 'fatal',
    '1' => 'fatal',
    '0' => 'fatal',
  }
  $level_filter = inline_template('priority = record["PRIORITY"]; <%= @replacements.inspect %>[priority] || record["level"] || "info"')

  fluentd::config::filter_record_transformer { 'streamline_priorities':
    pattern  => $pattern,
    priority => $priority,
    config   => {
      enable_ruby => true,
    },
    record   => {
      level => "\${${level_filter}}",
    },
  }

}
