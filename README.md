# KwykTree

Know-What-You-Know Tree

This is a sort of proof-of-concept hyper-"Feynman notebook" graph. Definitely
not API stable yet.

This assumes that there's several ways of knowing something, and divides things
into abstract *concepts* and concrete *implementations*. An implementation is
constructed by multiple concepts, and concepts can be underpinned by other
concepts. There's a presupposition that if you understand the base concepts of
an implementation, then the understanding of the implementation should be
straightforward ('easy' in the [Rich Hickey
sense](https://archive.org/details/simple-made-easy-rich-hickey-2011)).

## Running

Run kwyktree over a bunch of formatted YAML files (see the example and schema for more details)

```bash
# From rubygems
gem install kwyktree
kwyktree *.yaml

# From git source
git clone https://github.com/dafyddcrosby/kwyktree.git
bundle install
bundle exec bin/kwyktree examples/filesystems.yaml
firefox kwyktree.svg
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/dafyddcrosby/kwyktree
