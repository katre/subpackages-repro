def subs(name):
    # Collect subpackages.
    names = []
    for subpackage in native.subpackages(include = ["*"], allow_empty = True):
        names.append(subpackage)
    print("sub: Found subpackages %s" % ", ".join(names))

    native.filegroup(
        name = name,
    )
