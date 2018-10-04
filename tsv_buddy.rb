# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split(/\n/)
    keys = lines[0].split(/\t/)
    @data = []
    lines.drop(1).each do |line|
      items = line.split(/\t/)
      @data << Hash[keys.zip items]
    end
  end

  def to_line(values)
    values.join("\t") + "\n"
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    s = to_line(@data[0].keys)
    @data.each do |x|
      s << to_line(x.values)
    end
    s
  end
end
