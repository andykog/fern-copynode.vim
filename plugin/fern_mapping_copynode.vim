if exists('g:fern_mapping_copynode_loaded')
  finish
endif
let g:fern_mapping_copynode_loaded = 1

call add(g:fern#scheme#file#mapping#mappings, 'copynode')
