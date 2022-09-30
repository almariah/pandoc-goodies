function BlockQuote (para)
  start = para.content[1]
  if (start.t == "Para" and start.content[1].t == "Str" and
      start.content[1].text:match("^%[!%w+%][-+]?$")) then
      _, _, ctype = start.content[1].text:find("%[!(%w+)%]")

      tags = ctype

      title = ""

      start.content:remove(1)

      i = 1
      while start.content[i] and start.content[i].tag ~= 'SoftBreak' and start.content[i].tag ~= 'LineBreak'
      do
        title = title .. (start.content[i].text or " ")
        i = i + 1
      end

      if (title == "") then
        title = ctype
      end

      for i=1, i do
        start.content:remove(1)
      end

      blocks = {
        pandoc.RawInline(
          'html','<div class="admonition ' .. tags .. '">' ..
          '<p class="admonition-title">' .. title .. '</p>'
        ),
      }

      table.insert(blocks, start.content)

      i = 2
      while para.content[i] and para.content[i].tag ~= 'SoftBreak'
      do
        table.insert(blocks, para.content[i])
        i = i + 1
      end

      table.insert(blocks, pandoc.RawInline('html', '</div>'))

      return pandoc.Blocks(blocks)
  else
      return el
  end
end
