Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [
    syntax_colors: [
      number: :cyan,
      atom: :blue,
      string: :green,
      boolean: :magenta,
      nil: :red
    ],
    ls_directory: :magenta,
    ls_device: :blue,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ],
  default_prompt:
    "#{IO.ANSI.red()}[#{IO.ANSI.reset()}" <>
      "#{IO.ANSI.yellow()}%prefix#{IO.ANSI.reset()} " <>
      "#{IO.ANSI.green()}%counter#{IO.ANSI.reset()}" <>
      "#{IO.ANSI.red()}]#{IO.ANSI.reset()}" <>
      "#{IO.ANSI.blue()}|>#{IO.ANSI.reset()}",
  alive_prompt:
    "#{IO.ANSI.red()}[#{IO.ANSI.reset()}" <>
      "#{IO.ANSI.yellow()}%prefix#{IO.ANSI.reset()} " <>
      "#{IO.ANSI.green()}%node#{IO.ANSI.reset()}" <>
      "#{IO.ANSI.red()}]#{IO.ANSI.reset()}" <>
      "#{IO.ANSI.blue()}|>#{IO.ANSI.reset()}",
  history_size: 50,
  inspect: [
    pretty: true,
    limit: :infinity,
    width: 80,
    custom_options: [sort_maps: true]
  ],
  width: 80
)
