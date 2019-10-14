module DateHelpers
  # Attempts to parse date information into our preferred format,
  # or returns the input unchanged if it can't.

  def timeline_date(event)
    date = String.new

    if event["flag"] == "circa"
      date << "c. "
    end

    if event["end"]
      begin
        start_date = Date.parse(event.date.to_s).strftime('%b. %-d')
        end_date   = Date.parse(event.end.to_s).strftime('%-d, %Y')
      rescue
        start_date = event.date.to_s
        end_date   = event.end.to_s
      end
      date << start_date + "&ndash;" + end_date
    else
      begin
        raw_date = Date.parse(event.date.to_s)
        date << raw_date.strftime('%B %-d, %Y')
      rescue
        date << event.date.to_s
      end
    end

    "#{date}"
  end

  def sort_date(event)
    if event["sort_date"]
      Date.parse(event.sort_date.to_s)
    else
      Date.parse(event.date.to_s)
    end
  end
end
