require "rake/clean"
require "open3"

FIGURES = Dir["*.svg"].map{ |f| f.sub(/\.svg$/, ".pdf") }

CLEAN.include(Dir["*.{aux,log,out,bbl,blg}"])
CLEAN.include(FIGURES)
CLOBBER.include(Dir["*.pdf"])
DOCUMENTS = Dir["*.tex"].map{ |f| File.basename(f, ".tex") }

def runcap(cmd)
  puts cmd
  output, errors = nil
  Open3.popen3(cmd) do |stdin, stdout, stderr|
    stdin.close
    output = stdout.read
    errors = stderr.read
  end
  raise errors unless errors.empty?
  raise output if output =~ /error/i
  return output
end

rule ".pdf" => [".svg"] do |t|
  sh %{inkscape --export-area-drawing --export-pdf="#{t.name}" "#{t.source}"}
end

DOCUMENTS.each do |document|
  file "#{document}.pdf" => FIGURES + Dir["*.{bib,tex,cls}"] do |t|
    cmd = "xelatex #{document}"
    output = runcap(cmd)
    if output =~ /undefined citations/i
      runcap("bibtex #{document}")
      output = runcap(cmd)
    end
    while output =~ /rerun/i
      output = runcap(cmd)
    end
  end
end

desc "Generate documents."
task :default => DOCUMENTS.map{ |d| "#{d}.pdf" }

desc "Count the number of words in the documents."
task :wc do |t|
  sh "detex *.tex | wc -w"
end
