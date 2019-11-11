## Find, Replace, Rename

    find . -type f -name "*baz*" -exec sed -i 's/foo/bar/g' {} +
    find . -type f -name '*.log' ! -name '*.gz' -mtime +182 -exec gzip -9 "{}" \;

    for file in *.ext; do mv -vi "$file" "$( echo "$file" | sed "s/regex/replace/" )"; done

    sed -e "s/<VAR1>/${var1}/g" -e "s/<VAR2>/${var2}/g" /path/to/template > /path/to/file

    find * -type d -print0 | xargs -0 chmod 0755 # for directories
    find . -type f -print0 | xargs -0 chmod 0644 # for files
